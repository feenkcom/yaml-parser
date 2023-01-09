Class {
	#name : #Program,
	#superclass : #SmaCCParseNode,
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
Program >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]
