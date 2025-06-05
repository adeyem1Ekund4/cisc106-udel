courses = {'CISC': 'Comp Sci','ENGL':'English', 'CHEM':'Chemistry'}
print(courses.keys())
print(list(courses.keys()))
print(courses.items())
print(courses.get('CISC'))

print('CISC' in courses)
print('English' in courses)
print('ACCT' in courses)
