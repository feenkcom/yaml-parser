Class {
	#name : #YAMLMappinglistNode,
	#superclass : #YAMLRootNode,
	#instVars : [
		'mappings'
	],
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
YAMLMappinglistNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitMappinglist: self
]

{ #category : #generated }
YAMLMappinglistNode >> compositeNodeVariables [
	^ #(#mappings)
]

{ #category : #'generated-initialize-release' }
YAMLMappinglistNode >> initialize [
	super initialize.
	mappings := OrderedCollection new: 2.
]

{ #category : #generated }
YAMLMappinglistNode >> mappings [
	^ mappings
]

{ #category : #generated }
YAMLMappinglistNode >> mappings: anOrderedCollection [
	self setParents: self mappings to: nil.
	mappings := anOrderedCollection.
	self setParents: self mappings to: self
]
