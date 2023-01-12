Class {
	#name : #YAMLRootNode,
	#superclass : #SmaCCParseNode,
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
YAMLRootNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitRoot: self
]
