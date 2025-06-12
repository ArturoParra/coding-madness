def moveZeroes(nums):
    j = 0
    n = len(nums)
    for i in range(n):
        if nums[i] != 0:
            nums[j] = nums[i]
            j+=1
        
        if i != 0:
            nums[i] = 0

    return nums[:j]

# Pruebas
nums1 = [0, 1, 0, 3, 12]
moveZeroes(nums1)
print(nums1)  # [1, 3, 12, 0, 0]

nums2 = [0]
moveZeroes(nums2)
print(nums2)  # [0]

nums3 = [1, 0, 2, 0, 3]
moveZeroes(nums3)
print(nums3)  # [1, 2, 3, 0, 0]
            