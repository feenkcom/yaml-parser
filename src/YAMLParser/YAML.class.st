Class {
	#name : #YAML,
	#superclass : #SmaCCParseNode,
	#category : #YAMLParser
}

{ #category : #generated }
YAML >> acceptVisitor: aYAMLVisitor [
	^ aYAMLVisitor visitYAML: self
]
