Class {
	#name : #Day02,
	#superclass : #Object,
	#category : #AdventOfCode2019
}

{ #category : #accessing }
Day02 >> partOne: intCode [
	| opCode position valueOne valueTwo positionToUpdate |
	position := 1.
	opCode := intCode at: position.
	[ opCode ~= 99 ] whileTrue: [ 
	  valueOne := intCode at: (intCode at: (position + 1)) + 1.
	  valueTwo := intCode at: (intCode at: (position + 2)) + 1.
     positionToUpdate := (intCode at: (position + 3)) + 1.
	  ( opCode = 1 ) ifTrue: [ intCode at: positionToUpdate put: (valueOne + valueTwo)].
	  ( opCode = 2 ) ifTrue: [ intCode at: positionToUpdate put: (valueOne * valueTwo)].
	 position := position + 4.
	 opCode := intCode at: position.
	  ].
	^ intCode at: 1
]

{ #category : #'as yet unclassified' }
Day02 >> partTwo [
	| output input intCode|
	(1 to: 100) do: [ :noun | 
		(1 to: 100) do: [ :verb | 
			input := '1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,9,19,1,13,19,23,2,23,9,27,1,6,27,31,2,10,31,35,1,6,35,39,2,9,39,43,1,5,43,47,2,47,13,51,2,51,10,55,1,55,5,59,1,59,9,63,1,63,9,67,2,6,67,71,1,5,71,75,1,75,6,79,1,6,79,83,1,83,9,87,2,87,10,91,2,91,10,95,1,95,5,99,1,99,13,103,2,103,9,107,1,6,107,111,1,111,5,115,1,115,2,119,1,5,119,0,99,2,0,14,0'.
			
			intCode := (input splitOn: ',') collect: [ :each | each asInteger ].
			intCode at: 2 put: noun. 
			intCode at: 3 put: verb.
			output := self partOne: intCode.
			(output = 19690720) ifTrue: [ ^((100 * noun) + verb)]
			] ]
]

{ #category : #'as yet unclassified' }
Day02 >> partTwo: blaCode [
	| output input intCode|
	(1 to: 100) do: [ :noun | 
		(1 to: 100) do: [ :verb | 
			intCode := blaCode
			intCode at: 2 put: noun. 
			intCode at: 3 put: verb.
			output := self partOne: intCode.
			(output = 19690720) ifTrue: [ ^((100 * noun) + verb)]
			] ]
]

{ #category : #'as yet unclassified' }
Day02 >> runParts [
   | input test_input opCode |
   test_input := '1,9,10,3,2,3,11,0,99,30,40,50'.
	input := '1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,9,19,1,13,19,23,2,23,9,27,1,6,27,31,2,10,31,35,1,6,35,39,2,9,39,43,1,5,43,47,2,47,13,51,2,51,10,55,1,55,5,59,1,59,9,63,1,63,9,67,2,6,67,71,1,5,71,75,1,75,6,79,1,6,79,83,1,83,9,87,2,87,10,91,2,91,10,95,1,95,5,99,1,99,13,103,2,103,9,107,1,6,107,111,1,111,5,115,1,115,2,119,1,5,119,0,99,2,0,14,0'.
	opCode := (input splitOn: ',') collect: [ :each | each asInteger ].
	self halt.
	"opCode at: 2 put: 12.
	opCode at: 3 put: 2."
	^ self partTwo: opCode
]
