def longestCommonPrefix(strs):

    if not strs:
        return ""

    prefix = strs[0]
    for string in strs[1:]:
        while string.find(prefix) != 0:
            prefix = prefix[:-1]
            if not prefix:
                return ""
    return prefix

# Pruebas
print(longestCommonPrefix(["flower", "flow", "flight"]))       # "fl"
print(longestCommonPrefix(["dog", "racecar", "car"]))          # ""
print(longestCommonPrefix(["interstellar", "internet", "internal"]))  # "inte"