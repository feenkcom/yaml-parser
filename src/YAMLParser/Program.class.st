Class {
	#name : #Program,
	#superclass : #SmaCCParseNode,
	#category : #YAMLParser
}

{ #category : #generated }
Program >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]
