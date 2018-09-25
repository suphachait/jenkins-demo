import csv

#run tags read
def read_data(filename):
	f = open(filename, 'r')
	csvfile = csv.reader(f)
	f.close
	return [rows for rows in csvfile]


# run tags dev
# def write_data(datas):
# 	print(datas['email'])
# 	print(datas['mobile_no'])
# 	# TODO :: Write data to file output.csv
# 	f = open('output.csv', 'wb')
# 	fieldnames = ['email', 'mobile_no']
# 	csvfile = csv.DictWriter(f, fieldnames=fieldnames)
# 	csvfile.writeheader()
# 	csvfile.writerow(datas)
# 	f.close()


# run tags dev2
def write_data(datas, filename='output.csv'):
	f = open('output.csv', 'wb')
	fieldnames = ['email', 'mobile_no']
	csvfile = csv.DictWriter(f, fieldnames=fieldnames)
	csvfile.writeheader()
	for data in datas:
		csvfile.writerow(data)
	f.close()