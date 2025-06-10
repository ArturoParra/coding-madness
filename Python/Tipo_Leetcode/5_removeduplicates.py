def removeDuplicates(arr):
    n = len(arr)
    j = 1
    for i in range(1, n):
        if arr[i] != arr[i-1]:
            arr[j] = arr[i]
            j += 1
                
    return j

# Pruebas
nums1 = [1, 1, 2]
k1 = removeDuplicates(nums1)
print(k1, nums1[:k1])  # 2, [1, 2]

nums2 = [0,0,1,1,1,2,2,3,3,4]
k2 = removeDuplicates(nums2)
print(k2, nums2[:k2])  # 5, [0, 1, 2, 3, 4] 
