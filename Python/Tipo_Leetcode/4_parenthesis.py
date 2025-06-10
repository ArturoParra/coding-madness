def isValid(cadena):
    stack = []
    mapping = {")": "(", "}": "{", "]": "["}
    for c in cadena:
        if c in "([{":
            stack.append(c)
        elif c in ")]}":
            if not stack or stack.pop() != mapping[c]:
                return False
    return len(stack) == 0
    
    
# Pruebas
print(isValid("()"))        # True
print(isValid("()[]{}"))    # True
print(isValid("(]"))        # False
print(isValid("([)]"))      # False
print(isValid("{[]}"))      # True
