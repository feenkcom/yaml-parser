Class {
	#name : #YAMLListItemNode,
	#superclass : #YAMLRootNode,
	#instVars : [
		'value',
		'list'
	],
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
YAMLListItemNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitListItem: self
]

{ #category : #generated }
YAMLListItemNode >> list [
	^ list
]

{ #category : #generated }
YAMLListItemNode >> list: aYAMLlistItemsNode [
	self list notNil ifTrue: [ self list parent: nil ].
	list := aYAMLlistItemsNode.
	self list notNil ifTrue: [ self list parent: self ]
]

{ #category : #generated }
YAMLListItemNode >> nodeVariables [
	^ #(#value #list)
]

{ #category : #generated }
YAMLListItemNode >> value [
	^ value
]

{ #category : #generated }
YAMLListItemNode >> value: aYAMLIdentNode [
	self value notNil ifTrue: [ self value parent: nil ].
	value := aYAMLIdentNode.
	self value notNil ifTrue: [ self value parent: self ]
]
