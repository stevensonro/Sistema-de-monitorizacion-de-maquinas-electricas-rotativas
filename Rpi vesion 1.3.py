from ds18b20 import DS18B20
import Adafruit_DHT
import RPi.GPIO as GPIO
import math
import time
import pygame
import pygame.camera
import numpy as np
import matplotlib.pyplot as plt # eliminar al final
from scipy.io import wavfile
import os
import pyaudio
import struct
import wave
import serial
import minimalmodbus
import threading
import requests
import json
import base64

pinTaco = 2
pinDHT=3  # pin del sensor dht en GPIO
dsb = DS18B20() # el sensor dsb DEBE estar conectado en pin 4
rpm=[0.0]
elapse = 0
SenDHT= Adafruit_DHT.DHT11
start_timer = time.time()
pygame.camera.init()
camaron = pygame.camera.Camera("/dev/video0",(640,480))
camaron.start()
cvm = minimalmodbus.Instrument('/dev/ttyUSB0',1)
#url="https://pruebassistel.000webhostapp.com/insertardatos.php"
url="https://10.123.25.252/insertardatos.php" #url de prueba
GPIO.setmode(GPIO.BCM)
GPIO.setup(pinTaco,GPIO.IN,GPIO.PUD_UP)
f1=True
f2=True
f3=True
f4=True

class Microphone:
    
    def rms(self,frame):
        count = len(frame)/2
        format = "%dh"%(count)
        shorts = struct.unpack( format, frame )
        sum_squares = 0.0
        for sample in shorts:
            n = sample * (1.0/32768.0)
            sum_squares += n*n
        rms = math.pow(sum_squares/count,0.5);
        return rms * 1000

    
    def passiveListen(self,persona):
        
        CHUNK = 1024; RATE = 44000; THRESHOLD = 200; LISTEN_TIME = 1
        
        didDetect = False
        
        # prepare recording stream
        p = pyaudio.PyAudio()
        stream = p.open(format=pyaudio.paInt16, channels=1, rate=RATE, input=True, frames_per_buffer=CHUNK)
        
        # stores the audio data
        all =[]
        
        # starts passive listening for disturbances 
        #print (RATE / CHUNK * LISTEN_TIME)
        for i in range(0, int(RATE / CHUNK * LISTEN_TIME)):
            input = stream.read(CHUNK, exception_on_overflow= False)
            rms_value = self.rms(input)
            #print (rms_value)
            if (rms_value < THRESHOLD):
                didDetect = True
                break
            
        if not didDetect:
            stream.stop_stream()
            stream.close()
            return False
        
        # append all the chunks
        
        all.append(input)
        for i in range(0, 7):
            data = stream.read(CHUNK,exception_on_overflow= False)
            all.append(data)
            
        # save the audio data   
        data = (b''.join(all))
        stream.stop_stream()
        stream.close()
        wf = wave.open('audio.wav', 'wb')
        wf.setnchannels(1)
        wf.setsampwidth(p.get_sample_size(pyaudio.paInt16))
        wf.setframerate(RATE)
        wf.writeframes(data)
        
        wf.close()
        
        return True

def electricasI():
    global  electi,f1
    a = cvm.read_registers(0,40,3)
    b = cvm.read_registers(40,40,3)
    c = cvm.read_registers(80,16,3)
    
    electi=np.concatenate([a,b,c])
    f1=False
def electricasMM():
    global  electm,f2
    
    d = cvm.read_registers(96,40,3)
    e = cvm.read_registers(136,40,3)
    f = cvm.read_registers(176,16,3)
    g = cvm.read_registers(192,40,3)
    h = cvm.read_registers(232,40,3)
    i = cvm.read_registers(272,16,3)
    
    electm=np.concatenate([d,e,f,g,h,i])
    f2=False
def deltate(channel):
    global  start_timer, elapse, rpm  #pe startime
    elapse = time.time() - start_timer
    start_timer = time.time()
    rpm = [int(1/elapse * 60)]

def tomafoto():
    global foto64
    imagenmaquina=camaron.get_image()
    imagenmaquina=camaron.get_image()
    pygame.image.save(imagenmaquina,"fotomotor.jpg")
    foto = open("/home/pi/Desktop/fotomotor.jpg", 'rb')
    foto_leer = foto.read()
    foto64 = base64.encodestring(foto_leer)

def haceraudio():
    mic = Microphone()
    mic.passiveListen('ok Google')

def fft():
    global z,w,f3
    fs, data = wavfile.read('audio.wav')
    c = np.fft.fft(data)
    y=abs(c)
    w=y[:1000]
    l=len(w)
    for i in range(l):
        w[i]=int(w[i])
    #L = len(data)
    #freq = np.fft.fftfreq(L)
    #freq_in_hertz = abs(freq * fs)
    #x = freq_in_hertz
    #z=x[:1000]
    #5.37109375
    f3=False
def VarAmb():
    global ambien,f4
    Tmaq = dsb.get_temperature()
    amb = Adafruit_DHT.read_retry(SenDHT,pinDHT)
    ambien= [int(Tmaq*1000),int(amb[1]),int(amb[0])]
    f4=False
    




    
class hilo_elect(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self);

    def run(self):
        while True:
            i=0
            while i<3:
                electricasI()
                time.sleep(1)
                i=i+1
            electricasMM()
            time.sleep(1)       
        
class hilo_av(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self);

    def run(self):
        while True:
            tomafoto()
            haceraudio()
            fft()
            time.sleep(4)
            
class hilo_amb(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self);

    def run(self):
        while True:
            VarAmb()
            time.sleep(5)

class hilo_env(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self);

    def run(self):
        while True:
            global r,todo,tmp
            while f1 or f2 or f3 or f4:
                print("whait")
                time.sleep(0.5)
            a=[time.time()]
            todo=np.concatenate([a,rpm,ambien,electi,electm,w])
            tmp=todo.tolist()
            datos_json=json.dumps(tmp)
            #print(tmp[1:10])
            payload = {'json_payload' : datos_json,'foto': foto64} 
            r=requests.post(url,data=payload,verify=False)
            print(r.status_code)
            print(r.text)
            time.sleep(1)
        

GPIO.add_event_detect(pinTaco, GPIO.FALLING, callback = deltate, bouncetime = 20)



h1=hilo_elect();
h2=hilo_av();
h3=hilo_amb();
h4=hilo_env();
h1.start();
h2.start();
h3.start();
h4.start();