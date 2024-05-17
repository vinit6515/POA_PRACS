def left_shift(accumulator, quotient):
    return accumulator[1:] + quotient[0], quotient[1:] + "0"
def right_shift(accumulator, quotient):
    return "0" + accumulator[:-1], accumulator[-1] + quotient[:-1]
def add_binary(x, y):
    max_len = max(len(x), len(y))
    x = x.zfill(max_len)
    y = y.zfill(max_len)
    result = ''
    carry = 0
    for i in range(max_len - 1, -1, -1):
        r = carry
        r += 1 if x[i] == '1' else 0
        r += 1 if y[i] == '1' else 0
        result = ('1' if r % 2 == 1 else '0') + result
        carry = 0 if r < 2 else 1
    if carry != 0:
        result = '1' + result
    return result.zfill(max_len)

def complement(x):
    return ''.join('1' if bit == '0' else '0' for bit in x)

def restore_division(dividend, divisor):
    if len(dividend) < len(divisor):
        raise ValueError("Dividend must be greater than or equal to the divisor")

    dividend = dividend.lstrip('0')  # Remove leading zeros
    divisor = divisor.lstrip('0')  # Remove leading zeros
    accumulator = "0" * len(divisor)
    quotient = dividend[:len(divisor)]
    steps = []

    for i in range(len(dividend) - len(divisor) + 1):
        if accumulator[0] == "1":
            accumulator = add_binary(accumulator, divisor)
            steps.append(f"Step {i}: Subtract and Shift: A: {accumulator}, Q: {quotient}, 1")
        else:
            accumulator = add_binary(accumulator, complement(divisor))
            steps.append(f"Step {i}: Add and Shift: A: {accumulator}, Q: {quotient}, 0")

        accumulator, quotient = left_shift(accumulator, quotient)

    return steps

def main():
    dividend = input("Enter the dividend (binary): ")
    divisor = input("Enter the divisor (binary): ")

    steps = restore_division(dividend, divisor)

    print("\nRestoring Division Steps:")
    for step in steps:
        print(step)

if __name__ == "__main__":
    main()
