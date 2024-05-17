def left_shift(accumulator,quotient):
    return accumulator[1:]+ quotient[0],quotient[1:]+"0"
def add_binary(x,y):
    max_length=max(len(x),len(y))
    x=x.zfill(max_length)
    y=y.zfill(max_length)
    result=""
    carry=0
    for i in range(max_length-1,-1,-1):
        r=carry
        r+=1 if x[i]=='1' else 0
        r+=1 if y[i]=='1' else 0
        result=('1'if r%2==1 else '0')+ result
        carry=0 if r<2 else 1
    if carry!=0:
        result='1'+result
    return result.zfill(max_length)
def complement(x):
    return "".join("1" if bit=='0' else '0' for bit in x)
def restore_division(dividend,divisor):
    if (len(divisor)>len(dividend)):
        raise ValueError("Dividend greater than divisor")
    dividend=dividend.lstrip('0')
    divisor=divisor.lstrip('0')
    accumulator ='0'*len(divisor)
    quotient =dividend[:len(divisor)]
    steps=[]
    for i in range(len(dividend)-len(divisor)+1):
        if accumulator[0]=='1':
            accumulator=add_binary(accumulator,divisor)
            steps.append(f"\nStep{i}: Subtract & Shift A : {accumulator} Q: {quotient},1")
        else:
            accumulator=add_binary(accumulator,complement(divisor))
            steps.append(f"\nStep{i}: Add & Shift A : {accumulator} Q: {quotient},0")
        accumulator,quotient=left_shift(accumulator,quotient)
    return steps
def main():
    dividend=input('\nEnter the dividend: ')
    divisor=input('\nEnter the divisor: ')
    steps= restore_division(dividend,divisor)
    for step in steps:
        print(step)
if __name__=="__main__":
    main()

