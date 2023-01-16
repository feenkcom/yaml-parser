Class {
	#name : #YAMLMappingNode,
	#superclass : #YAMLRootNode,
	#instVars : [
		'key',
		'mappingList',
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
YAMLMappingNode >> mappingList [
	^ mappingList
]

{ #category : #generated }
YAMLMappingNode >> mappingList: aYAMLmappingsNode [
	self mappingList notNil ifTrue: [ self mappingList parent: nil ].
	mappingList := aYAMLmappingsNode.
	self mappingList notNil ifTrue: [ self mappingList parent: self ]
]

{ #category : #generated }
YAMLMappingNode >> nodeVariables [
	^ #(#key #mappingList #value)
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
