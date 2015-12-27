import re
op_code = {
    "add" : "000000",
    "addi" : "001000",
    "lw" : "100011",
    "sw" : "101011",
    "sll" : "000000",
    "and" : "000000",
    "andi" : "001100",
    "nor" : "000000",
    "beq" : "000100",
    "jal" : "000011",
    "jr" : "000000",
    "slt" : "000000" }
registers = {
    "$zero" : "00000",
    "$at"   : "00001",
    "$v0"   : "00010",
    "$v1"   : "00011",
    "$a0"   : "00100",
    "$a1"   : "00101",
    "$a2"   : "00110",
    "$a3"   : "00111",
    "$t0"   : "01000",
    "$t1"   : "01001",
    "$t2"   : "01010",
    "$t3"   : "01011",
    "$t4"   : "01100",
    "$t5"   : "01101",
    "$t6"   : "01110",
    "$t7"   : "01111",
    "$s0"   : "10000",
    "$s1"   : "10001",
    "$s2"   : "10010",
    "$s3"   : "10011",
    "$s4"   : "10100",
    "$s5"   : "10101",
    "$s6"   : "10110",
    "$s7"   : "10111",
    "$t8"   : "11000",
    "$t9"   : "11001",
    "$k0"   : "11010",
    "$k1"   : "11011",
    "$gp"   : "11100",
    "$sp"   : "11101",
    "$fp"   : "11110",
    "$ra"   : "11111",
}
inst = ""
labels ={}
inst_count = -1
fr = open('test5.mips', 'r')
fc = open('test5.mips', 'r')
fw = open('output.binary', 'w')
for l in fc:
    l = l.lstrip()
    if not re.search('^#.*', l):
        inst_count +=1
    l = re.sub('#.*', '', l)
    if ":" in l:
        labels[re.sub(':.*|\n', '', l)] = inst_count
        inst_count -=1
count = 1
for line in fr:
    line = line.lstrip()
    line = re.sub('[a-zA-Z]+:|#.*|\n', '', line)
    line = line.lstrip()
    y = re.split(', |,| ', line)
    if y[0] in op_code.keys():
        if op_code[y[0]] == "000000":
            if y[0] == "add":
                inst += op_code[y[0]]+registers[y[2]]+registers[y[3]]+registers[y[1]] +"00000"+ "100000"
            elif y[0] == "and":
                inst += op_code[y[0]]+registers[y[2]]+registers[y[3]]+registers[y[1]] +"00000"+ "100100"
            elif y[0] == "sll":
                inst += op_code[y[0]] + "00000" + registers[y[2]]+registers[y[1]] + str(format(int(y[3]), '05b')) + "000000"
            elif y[0] == "jr":
                inst += op_code[y[0]]+registers[y[1]] + "000000000000000001000"
            elif y[0] == "slt":
                inst += op_code[y[0]]+registers[y[2]]+registers[y[3]]+registers[y[1]] +"00000"+ "101010"
            elif y[0] == "nor":
                inst += op_code[y[0]]+registers[y[2]]+registers[y[3]]+registers[y[1]] +"00000"+ "100111"
        elif y[0] == "jal":
            pos = abs(count - labels[y[1]]) if count<labels[y[1]] else abs(count - labels[y[1]])-1
            inst += op_code[y[0]] + str(format(pos, '026b'))
        elif y[0] == "lw" or y[0] == "sw":
            d = y[2][:-1]
            m = re.split('\(', d)
            inst += op_code[y[0]] + registers[m[1]] + registers[y[1]] + str(format(int(m[0]), '016b'))
        elif y[0] == "beq":
            pos = abs(count - labels[y[1]]) if count<labels[y[1]] else abs(count - labels[y[1]])-1
            inst += op_code[y[0]] + registers[y[1]] + registers[y[2]] + str(format(pos, '016b'))
        else:
            inst += op_code[y[0]] + registers[y[2]] + registers[y[1]] + str(format(int(y[3]), '016b'))
        count +=1
    elif line == "":
        continue
    else:
        inst += "Unknown instruction"
inst = '\n'.join(inst[i:i+8] for i in xrange(0,len(inst),8))
fw.write(inst)
