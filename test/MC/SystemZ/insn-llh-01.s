# RUN: llvm-mc -triple s390x-linux-gnu -show-encoding %s | FileCheck %s

#CHECK: llh	%r0, -524288            # encoding: [0xe3,0x00,0x00,0x00,0x80,0x95]
#CHECK: llh	%r0, -1                 # encoding: [0xe3,0x00,0x0f,0xff,0xff,0x95]
#CHECK: llh	%r0, 0                  # encoding: [0xe3,0x00,0x00,0x00,0x00,0x95]
#CHECK: llh	%r0, 1                  # encoding: [0xe3,0x00,0x00,0x01,0x00,0x95]
#CHECK: llh	%r0, 524287             # encoding: [0xe3,0x00,0x0f,0xff,0x7f,0x95]
#CHECK: llh	%r0, 0(%r1)             # encoding: [0xe3,0x00,0x10,0x00,0x00,0x95]
#CHECK: llh	%r0, 0(%r15)            # encoding: [0xe3,0x00,0xf0,0x00,0x00,0x95]
#CHECK: llh	%r0, 524287(%r1,%r15)   # encoding: [0xe3,0x01,0xff,0xff,0x7f,0x95]
#CHECK: llh	%r0, 524287(%r15,%r1)   # encoding: [0xe3,0x0f,0x1f,0xff,0x7f,0x95]
#CHECK: llh	%r15, 0                 # encoding: [0xe3,0xf0,0x00,0x00,0x00,0x95]

	llh	%r0, -524288
	llh	%r0, -1
	llh	%r0, 0
	llh	%r0, 1
	llh	%r0, 524287
	llh	%r0, 0(%r1)
	llh	%r0, 0(%r15)
	llh	%r0, 524287(%r1,%r15)
	llh	%r0, 524287(%r15,%r1)
	llh	%r15, 0
