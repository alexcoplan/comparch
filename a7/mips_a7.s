# Exercise A.7 solution for MIPS

.set mips64
.global exA7

# $a0 is the base address
exA7:
  sd $0, 7000($a0) # i := 0
.L0:
  ld $t0, 7000($a0)   # t0 := i
  slti $t1, $t0, 101 # t1 := (t0 < 101)
  beqz $t1, .L1
  dsll $t1, $t0, 3    # t1 := (t0 << 3), to index 64-bit arrays
  daddu $t1, $t1, $a0 # t1 += a0 (add base address)
  ld $t2, 3000($t1)   # t2 := B[i]
  ld $t3, 5000($a0)   # t3 := C
  dadd $t2, $t2, $t3  # t2 += t3
  sd $t2, 1000($t1)   # A[i] := t2
  daddi $t0, $t0, 1  # t0++
  sd $t0, 7000($a0)   # i := t0
  j .L0
.L1:
  jr $ra
