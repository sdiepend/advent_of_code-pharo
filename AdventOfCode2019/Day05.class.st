Class {
	#name : #Day05,
	#superclass : #Object,
	#category : #AdventOfCode2019
}

{ #category : #helpers }
Day05 >> defineValue: mode codes: someCodes parameter: aParameter [
 (mode = $0) ifTrue: [ ^someCodes at: aParameter + 1 ].
 (mode = $1) ifTrue: [ ^aParameter ].
	
]

{ #category : #helpers }
Day05 >> inputString [
	^'3,225,1,225,6,6,1100,1,238,225,104,0,1002,114,19,224,1001,224,-646,224,4,224,102,8,223,223,1001,224,7,224,1,223,224,223,1101,40,62,225,1101,60,38,225,1101,30,29,225,2,195,148,224,1001,224,-40,224,4,224,1002,223,8,223,101,2,224,224,1,224,223,223,1001,143,40,224,101,-125,224,224,4,224,1002,223,8,223,1001,224,3,224,1,224,223,223,101,29,139,224,1001,224,-99,224,4,224,1002,223,8,223,1001,224,2,224,1,224,223,223,1101,14,34,225,102,57,39,224,101,-3420,224,224,4,224,102,8,223,223,1001,224,7,224,1,223,224,223,1101,70,40,225,1102,85,69,225,1102,94,5,225,1,36,43,224,101,-92,224,224,4,224,1002,223,8,223,101,1,224,224,1,224,223,223,1102,94,24,224,1001,224,-2256,224,4,224,102,8,223,223,1001,224,1,224,1,223,224,223,1102,8,13,225,1101,36,65,224,1001,224,-101,224,4,224,102,8,223,223,101,3,224,224,1,223,224,223,4,223,99,0,0,0,677,0,0,0,0,0,0,0,0,0,0,0,1105,0,99999,1105,227,247,1105,1,99999,1005,227,99999,1005,0,256,1105,1,99999,1106,227,99999,1106,0,265,1105,1,99999,1006,0,99999,1006,227,274,1105,1,99999,1105,1,280,1105,1,99999,1,225,225,225,1101,294,0,0,105,1,0,1105,1,99999,1106,0,300,1105,1,99999,1,225,225,225,1101,314,0,0,106,0,0,1105,1,99999,8,677,226,224,1002,223,2,223,1006,224,329,1001,223,1,223,1108,226,226,224,1002,223,2,223,1005,224,344,101,1,223,223,1108,226,677,224,1002,223,2,223,1006,224,359,101,1,223,223,107,226,226,224,1002,223,2,223,1005,224,374,101,1,223,223,1107,226,226,224,1002,223,2,223,1005,224,389,101,1,223,223,107,677,677,224,102,2,223,223,1006,224,404,101,1,223,223,1008,226,226,224,1002,223,2,223,1006,224,419,101,1,223,223,108,677,226,224,1002,223,2,223,1006,224,434,101,1,223,223,1108,677,226,224,102,2,223,223,1005,224,449,101,1,223,223,1008,677,226,224,102,2,223,223,1006,224,464,1001,223,1,223,108,677,677,224,102,2,223,223,1005,224,479,101,1,223,223,7,677,677,224,102,2,223,223,1005,224,494,1001,223,1,223,8,226,677,224,102,2,223,223,1006,224,509,101,1,223,223,107,677,226,224,1002,223,2,223,1005,224,524,1001,223,1,223,7,677,226,224,1002,223,2,223,1005,224,539,1001,223,1,223,1007,226,677,224,1002,223,2,223,1005,224,554,1001,223,1,223,8,677,677,224,102,2,223,223,1006,224,569,101,1,223,223,7,226,677,224,102,2,223,223,1006,224,584,1001,223,1,223,1008,677,677,224,102,2,223,223,1005,224,599,101,1,223,223,1007,677,677,224,1002,223,2,223,1006,224,614,101,1,223,223,1107,677,226,224,1002,223,2,223,1006,224,629,101,1,223,223,1107,226,677,224,1002,223,2,223,1006,224,644,101,1,223,223,1007,226,226,224,102,2,223,223,1005,224,659,1001,223,1,223,108,226,226,224,102,2,223,223,1006,224,674,101,1,223,223,4,223,99,226'
]

{ #category : #puzzles }
Day05 >> partOne [
| codes inputInteger position opCode moveForward valueOne valueTwo firstParameterMode secondParameterMode thirdParameterMode instruction |
codes := ((self inputString) splitOn: ',') collect: [ :each | each asInteger ].
inputInteger := 1.
position := 1.
opCode := -1.
moveForward := 0.
[ opCode ~= 99 ] whileTrue: [ 
	instruction := (codes at: position) printPaddedWith: $0 to: 5. "or use modulo..."
   opCode := (instruction copyFrom: 4 to: 5) asInteger.
   firstParameterMode := instruction at: 3.
   secondParameterMode := instruction at: 2.
   thirdParameterMode := instruction at: 1.
   
	
	( opCode = 3 ) ifTrue: [ codes at: ((codes at: position + 1) + 1) put: inputInteger.
		                      moveForward := 2. ].
	( opCode = 4 ) ifTrue: [ Transcript show: '',(codes at: (codes at: position + 1) + 1 ) asString;cr.
		moveForward := 2. 
		"self halt."].
	( opCode = 1 or: opCode = 2 ) ifTrue: [ 
		valueOne := self defineValue: firstParameterMode codes: codes parameter: (codes at: position + 1).
		valueTwo := self defineValue: secondParameterMode codes: codes parameter: (codes at: position + 2).
		moveForward := 4 ].
	( opCode = 1 ) ifTrue: [ codes at: ((codes at: (position + 3)) + 1) put: (valueOne + valueTwo) ].
	( opCode = 2 ) ifTrue: [ codes at: ((codes at: (position + 3)) + 1) put: (valueOne * valueTwo) ].
	position := position + moveForward.
]
]

{ #category : #puzzles }
Day05 >> partTwo [
 | codes inputInteger position opCode moveForward valueOne valueTwo firstParameterMode secondParameterMode thirdParameterMode instruction new_position |
codes := ((self inputString) splitOn: ',') collect: [ :each | each asInteger ].
inputInteger := 5.
position := 1.
opCode := -1.
moveForward := 0.
new_position := position.
[ opCode ~= 99 ] whileTrue: [ 
	instruction := (codes at: position) printPaddedWith: $0 to: 5. "or use modulo..."
   opCode := (instruction copyFrom: 4 to: 5) asInteger.
   firstParameterMode := instruction at: 3.
   secondParameterMode := instruction at: 2.
   thirdParameterMode := instruction at: 1.
   
	
	( opCode = 3 ) ifTrue: [ codes at: ((codes at: position + 1) + 1) put: inputInteger.
		                      new_position := position + 2. ].
	( opCode = 4 ) ifTrue: [ Transcript show: '',(codes at: (codes at: position + 1) + 1 ) asString;cr.
		new_position := position + 2. 
		"self halt."].
	 (#( 1 2 5 6 7 8) includes: opCode ) ifTrue: [ 
		valueOne := self defineValue: firstParameterMode codes: codes parameter: (codes at: position + 1).
		valueTwo := self defineValue: secondParameterMode codes: codes parameter: (codes at: position + 2).
		 ].
	( opCode = 1 ) ifTrue: [ codes at: ((codes at: (position + 3)) + 1) put: (valueOne + valueTwo).
		new_position := position + 4 ].
	( opCode = 2 ) ifTrue: [ codes at: ((codes at: (position + 3)) + 1) put: (valueOne * valueTwo).
		new_position := position + 4 ].
	( opCode = 5 ) ifTrue: [ (valueOne ~= 0) ifTrue: [ new_position := (valueTwo + 1) ]
		                                      ifFalse: [ new_position := (position + 3) ] ].
	( opCode = 6 ) ifTrue: [ (valueOne = 0) ifTrue: [ new_position := (valueTwo + 1)]
		                                     ifFalse: [ new_position := (position + 3)]].
	( opCode = 7 ) ifTrue: [ (valueOne < valueTwo) ifTrue: [ codes at: (codes at: position + 3) + 1 put: 1 ]
		                                            ifFalse: [ codes at: (codes at: position + 3) + 1 put: 0 ]. 
		                      new_position := position + 4 ].
	( opCode = 8 ) ifTrue: [ (valueOne = valueTwo) ifTrue: [ codes at: (codes at: position + 3) + 1 put: 1 ]
		                                            ifFalse: [ codes at: (codes at: position + 3) + 1 put: 0 ]. 
		                      new_position := position + 4 ].
	position := new_position.
]

]
