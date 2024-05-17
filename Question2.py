# Restoring Division Algorithm
def left_shift(accumulator,quotient):
    return accumulator[1:]+quotient[0], quotient[1:]+'0'
def binary_add(x,y):
    max_length=max(len(x),len(y))
    x=x.zfill(max_length)
    y=y.zfill(max_length)
    carry=0
    result=''
    for i in range(max_length-1,-1,-1):
        r=carry
        r+=1 if x[i]=='1' else 0
        r+=1 if y[i]=='1' else 0
        result=('1' if r%2==1 else '0')+ result
        carry=0 if r < 2 else 1
    if carry!=0:
        result='1'+result
    return result.zfill(max_length)
def complement(x):
    return ''.join('1'if bit==0 else '0' for bit in x)
def restore_division(dividend,divisor):
    if(len(divisor)>len(dividend)):
        raise ValueError("Dividend must be greater than divisor.")
    dividend = dividend.lstrip('0')
    divisor = divisor.lstrip('0')
    accumulator ='0'*len(divisor)
    quotient = dividend[:len(divisor)]
    steps = []
    for i in range (len(dividend)-len(divisor)+1):
        if accumulator[0]=='1':
            accumulator=binary_add(accumulator,divisor)
            steps.append(f"Steps {i} : Subtract & Shift A : {accumulator} Q : {quotient},1")
        else:
            accumulator=binary_add(accumulator,complement(divisor))
            steps.append(f"Steps {i} : Add & Shift A : {accumulator} Q : {quotient},0")
        accumulator,quotient=left_shift(accumulator,quotient)
    return steps
def main():
    dividend = input("\nEnter the dividend (binary) :")
    divisor = input("\nEnter the divisor (binary) :")
    steps = restore_division(dividend,divisor)
    for step in steps:
        print(step)
if __name__=="__main__":
    main()

