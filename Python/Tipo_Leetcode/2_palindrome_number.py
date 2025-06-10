def palindrome_num(num):
    if num < 0:
        return False
    
    rversed = 0

    while num > rversed:
        rversed = rversed * 10 + num % 10
        num //= 10
    
    return num == rversed or num == rversed // 10

print(palindrome_num(122))
print(palindrome_num(121))
print(palindrome_num(12321))
print(palindrome_num(12345))

