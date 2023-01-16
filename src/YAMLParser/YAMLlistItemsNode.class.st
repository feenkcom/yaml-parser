Class {
	#name : #YAMLlistItemsNode,
	#superclass : #YAMLRootNode,
	#instVars : [
		'listItems'
	],
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
YAMLlistItemsNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitlistItems: self
]

{ #category : #generated }
YAMLlistItemsNode >> compositeNodeVariables [
	^ #(#listItems)
]

{ #category : #'generated-initialize-release' }
YAMLlistItemsNode >> initialize [
	super initialize.
	listItems := OrderedCollection new: 2.
]

{ #category : #generated }
YAMLlistItemsNode >> listItems [
	^ listItems
]

{ #category : #generated }
YAMLlistItemsNode >> listItems: anOrderedCollection [
	self setParents: self listItems to: nil.
	listItems := anOrderedCollection.
	self setParents: self listItems to: self
]
