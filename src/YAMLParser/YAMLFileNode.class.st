Class {
	#name : #YAMLFileNode,
	#superclass : #YAMLRootNode,
	#instVars : [
		'document'
	],
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
YAMLFileNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitFile: self
]

{ #category : #generated }
YAMLFileNode >> document [
	^ document
]

{ #category : #generated }
YAMLFileNode >> document: aYAMLMappinglistNode [
	self document notNil ifTrue: [ self document parent: nil ].
	document := aYAMLMappinglistNode.
	self document notNil ifTrue: [ self document parent: self ]
]

{ #category : #generated }
YAMLFileNode >> nodeVariables [
	^ #(#document)
]
