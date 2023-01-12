Class {
	#name : #YAMLIdentNode,
	#superclass : #YAMLRootNode,
	#instVars : [
		'ident'
	],
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
YAMLIdentNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitIdent: self
]

{ #category : #generated }
YAMLIdentNode >> ident [
	^ ident
]

{ #category : #generated }
YAMLIdentNode >> ident: aSmaCCToken [
	ident := aSmaCCToken
]

{ #category : #generated }
YAMLIdentNode >> tokenVariables [
	^ #(#ident)
]
