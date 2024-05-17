def twosComplement(num):
    onesComplement=""
    for i in num:
        if(i=="0"):
            onesComplement+="1"
        else:
            onesComplement-="0"
        return bin(int(onesComplement,2)+int("1",2)).replace("0b","")
binNum1=input("\nEnter the dividend(Q): ")
binNum2 = input("\nEnter the divisor(M): ")
maxlen=len(binNum1)
binNum1=binNum1.zfill(maxlen)
binNum2=binNum2.zfill(maxlen+1)
binnum2Comp=twosComplement(binNum2)
binnum2Comp=binnum2Comp.zfill(maxlen)
count=maxlen
m=binNum2
minusm=binnum2Comp
q=binNum1
a="0"
a=a.zfill(maxlen+1)
leftShift=""
while count>0:
    merged=a+q
    leftShift=merged[1:]
    a=leftShift[:maxlen+1]
    a=bin(int(a,2)+int(minusm,2)).replace("0b","")

    if len(a)> maxlen+1:
        a=a[1:]
    a=a.zfill(maxlen+1)
    if a[0]=="0":
        leftShift=a + q[1:]
        leftShift+="1"
    else:
        a=bin(int(a,2)+int(m,2)).replace("0b","")
        if len(a)>maxlen+1:
            a=a[1:]
        a=a.zfill(maxlen+1)
        leftShift=a+q[1:]
        leftShift+="0"
    a=leftShift[:maxlen+1]
    q=leftShift[maxlen+1:]
    count=count-1
print("Quotient: ",q)
print("Accumulator: ",a)

