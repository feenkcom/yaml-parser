Class {
	#name : #YAML,
	#superclass : #SmaCCParseNode,
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
YAML >> acceptVisitor: aYAMLVisitor [
	^ aYAMLVisitor visitYAML: self
]
