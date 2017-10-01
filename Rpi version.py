import time
import serial
import requests
import numpy
import minimalmodbus
import json


cvm = minimalmodbus.Instrument('COM3',1)
cvm.serial.baudrate = 9600
cvm.serial.bytesize=8
cvm.serial.parity=serial.PARITY_NONE
cvm.serial.stopbits=1
cvm.serial.timeout=1

url="https://pruebassistel.000webhostapp.com/insertardatos.php"
i=1
while 1:

    TP=time.time()
    
    
    basicos = cvm.read_registers(0,10,3)
    T = basicos[1]
    C = basicos[3]
    PA = basicos[5]
    PR = basicos[7]
    FP = basicos[9]

    frecdist = cvm.read_registers(40,16,3)
    F = frecdist[1]
    DV = frecdist[9]
    DC = frecdist[15]

    energia = cvm.read_registers(60,8,3)
    ACT = energia[1]
    IND = energia[3]
    CAP = energia[5]
    APA = energia[7]

    todos=[T,C,PA,PR,FP,F,DV,DC,ACT,IND,CAP,APA]
    print(i)
    i=i+1
    print(todos)

    requests.post(url,data=({'tiempounix':TP,'tension':T,'corriente':C,'preact':PA,'preac':PR,'facpo':FP,'frec':F,'disv':DV,'disc':DC,'eneract':ACT,'enereac':IND,'enercap':CAP,'enerapa':APA}))
    time.sleep(1)
