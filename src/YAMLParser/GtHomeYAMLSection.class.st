Class {
	#name : #GtHomeYAMLSection,
	#superclass : #GtHomeSection,
	#category : #'YAMLParser-Sections'
}

{ #category : #accessing }
GtHomeYAMLSection >> create [
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'YAML Parser').
	cardsContainer := self newCardsContainer.
	cardsContainer
		addChild: (self
				newHeaderCardWithTitle: 'YAML Parser'
				description: 'See the YAML Parser Lepiter pages'
				size: 200 @ 150
				content: (BrLabel new
						text: 'YAML Parser';
						aptitude: BrGlamorousLabelAptitude new bold;
						padding: (BlInsets all: 20)) asScalableElement
				action: [ :card | 
					| database startPage |
					database := LeDatabasesRegistry default currentLoadedDefaultLogicalDatabase
							databaseNamed: 'YAML Parser Notebook'.
					startPage := database pageNamed: 'YAML Parser Overview'.
					GtWorldUtility
						showSpaceWithTitle: startPage title
						inPagerWith: [ startPage asLepiterPagePhlowTool asElementDo: [ :e | e ] ]
								asStencil
						from: card ]).
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]
