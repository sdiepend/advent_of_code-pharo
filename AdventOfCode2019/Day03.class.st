Class {
	#name : #Day03,
	#superclass : #Object,
	#category : #AdventOfCode2019
}

{ #category : #'as yet unclassified' }
Day03 >> drawWire: wire [
  | position grid moves steps direction changes i|
  changes := { $R -> #(1 0) . $D -> #(0 -1) . $L -> #(-1 0) . $U -> #(0 1) } asDictionary.
  grid := Bag new.
  position := 0@0.
  moves := wire splitOn: ','.
  moves do: [ :move |
    steps := (move copyFrom: 2 to: (move size)) asInteger.
    direction := move at: 1.
    i := 0.
    [i < steps] whileTrue: [
      position := (position x + ((changes at: direction) at: 1))@(position y + ((changes at: direction) at: 2)).
      grid add: position.
      i := i + 1.
		 ] ].
  grid := (grid asSet) asBag.
  ^ grid
]

{ #category : #'as yet unclassified' }
Day03 >> drawWireImproved: wire [
| position positions moves steps direction changes i|
  changes := { $R -> #(1 0) . $D -> #(0 -1) . $L -> #(-1 0) . $U -> #(0 1) } asDictionary.
  positions := OrderedCollection new.
  position := 0@0.
  moves := wire splitOn: ','.
  moves do: [ :move |
    steps := (move copyFrom: 2 to: (move size)) asInteger.
    direction := move at: 1.
    i := 0.
    [i < steps] whileTrue: [
      position := (position x + ((changes at: direction) at: 1))@(position y + ((changes at: direction) at: 2)).
      positions add: position.
      i := i + 1.
		 ] ].
  ^ positions
]

{ #category : #accessing }
Day03 >> partOne: wires [
	| distance shortestDistance joinedGrid |
	joinedGrid := Bag new.
   wires do: [ :wire | joinedGrid addAll: (self drawWire: wire)].

   shortestDistance := 9999999.
   joinedGrid do: [ :point | 
	  ((joinedGrid occurrencesOf: point) = 2) ifTrue: [ 
		 distance := ((point x) abs + (point y) abs).
		 (distance < shortestDistance ) ifTrue: [
			shortestDistance := distance. ] ] ].
   ^ shortestDistance



]

{ #category : #'as yet unclassified' }
Day03 >> partTwo: wires [
]
