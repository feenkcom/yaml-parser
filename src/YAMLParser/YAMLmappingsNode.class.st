Class {
	#name : #YAMLmappingsNode,
	#superclass : #YAMLRootNode,
	#instVars : [
		'mappings'
	],
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
YAMLmappingsNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitmappings: self
]

{ #category : #generated }
YAMLmappingsNode >> compositeNodeVariables [
	^ #(#mappings)
]

{ #category : #'generated-initialize-release' }
YAMLmappingsNode >> initialize [
	super initialize.
	mappings := OrderedCollection new: 2.
]

{ #category : #generated }
YAMLmappingsNode >> mappings [
	^ mappings
]

{ #category : #generated }
YAMLmappingsNode >> mappings: anOrderedCollection [
	self setParents: self mappings to: nil.
	mappings := anOrderedCollection.
	self setParents: self mappings to: self
]
