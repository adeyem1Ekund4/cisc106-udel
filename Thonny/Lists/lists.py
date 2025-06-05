a_list = [33, 47, 99, 17, "T", -14, "st", 9.9]
print(a_list [4])

# example 2
b_list = [33, 47, 99, 17, "T", -14, "st", 9.9]
b_length = len(b_list)
print(b_length)

d_list = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
i = 0
while(i < len(d_list)):
    print (d_list[i])
    i +=1
    
sz = int(input("How many # in the table?"))
num_list = list(range(sz))

for i in num_list:
        next_num = int(input("Next number?"))
        num_list[i] = next_num
print(list(num_list))

#example 5
size = int(input("How many number in."))
num_list = list(range(size))

def  find_max(nums):
    maxx = nums[0]
    sz = len(nums)
    for i in [1,sz-1]:
        if (num[1] > maxx):
            maxx = nums[i]
    return (maxx)

for i in num_list:
        next_num = int(input("Next number?"))
        num_list[i] = next_num
print(list(num_list))
maximum = find_max(num_list)
print(maximum)