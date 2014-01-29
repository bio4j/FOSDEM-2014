% Bio4j
% [Pablo Pareja](http://twitter.com/pablopareja)
% GraphDevRoom 2014

----

## what is Bio4j

Sort of short abstract of the project

<!-- 4 or more '-' create a new slide -->
----

### open source

- **code** **[AGPLv3](https://www.gnu.org/licenses/agpl-3.0.html)**
- **data** integrates only **[open data](http://okfn.org/opendata/)**

----

### biology & DBs today

* Problems with technology choices (RDB and so on)
* Biology is a graph and all that blablabla

----

### data sources - modules

<!-- 
  the '>' symbol here is for showing items incrementally 
-->
> * Gene Ontology (GO)
> * ExPASy Enzyme DB
> * RefSeq

----

### data sources - modules

> * UniRef --> 50, 90, 100
> * NCBI taxonomy tree -> GI index
> * Uniprot KB -> Swissprot/Trembl, interactions...

----

###  numbers

**Some numbers**

* `1,216,993,547` relationships
* `190,625,351` nodes
* `584,436,429` properties

----

### a bit of history

* How it all started (Gene Ontology & BG7)
* How it became the BigData platform it is today

----

### the property graph model

* Simple explanation with a couple of samples

----

### Bio4j structure

* Modules and relationship among them

----

### domain model

* Diagram (maybe also Bio4jExplorer??)

----

<!-- 
  it looks deformed because of the aspect ratio; it should be at least 4:3
-->
![](Bio4jDomainModelWithCardinality.jpg)

----

### Blueprints layer

Apart from the set of interfaces developed as the **first layer** for the _domain model_ there's an **extra layer** that uses _Blueprints_. This way we’re going one step further for making the domain model **independent** from the choice of _database technology_

----

### technology options

**Titan** and **Neo4j**

----

### Neo4j

* Cypher
* Gremlin
* Java API
* Visualizations?

----

### Titan

* **local** indexes
* **type** definitions -> _constraints!_

----

#### Bio4j and the cloud

* Interoperability and data distribution
* Backup and storage
* Scalability
* Cost-effective
* Applications and service providers on the cloud

----

### github?

Using **github** together with Bio4j & SBT ? 

----

### dev and release process

* Mention Statika??

----

### use cases

* BG7 (again?)
* MG7
* Ohnogaps?
* Nispero?
* Ohio State blablaba?
* Berkeley blablabla?

----

### community

* LinkedIn
* Github
* Google group
* Twitter
* Etc...

----

###  team

----