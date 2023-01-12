Class {
	#name : #YAMLMappingNode,
	#superclass : #YAMLRootNode,
	#instVars : [
		'key',
		'value'
	],
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
YAMLMappingNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitMapping: self
]

{ #category : #generated }
YAMLMappingNode >> key [
	^ key
]

{ #category : #generated }
YAMLMappingNode >> key: aYAMLIdentNode [
	self key notNil ifTrue: [ self key parent: nil ].
	key := aYAMLIdentNode.
	self key notNil ifTrue: [ self key parent: self ]
]

{ #category : #generated }
YAMLMappingNode >> nodeVariables [
	^ #(#key #value)
]

{ #category : #generated }
YAMLMappingNode >> value [
	^ value
]

{ #category : #generated }
YAMLMappingNode >> value: aYAMLIdentNode [
	self value notNil ifTrue: [ self value parent: nil ].
	value := aYAMLIdentNode.
	self value notNil ifTrue: [ self value parent: self ]
]