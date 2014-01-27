
# Neo4j

- [What's new in Neo4j 2.0](http://www.slideshare.net/neo4j/webinar-whats-new-in-neo4j-20)
- [On graph data model design - relationships](http://savas.me/2013/03/on-graph-data-model-design-relationships/)
 - [Same csv files different neo4j database](http://blog.bruggen.com/2013/10/same-csv-files-different-neo4j-database.html)

## labels

Neo4j 2.0 brings [labels](http://www.neo4j.org/develop/labels), marketed as a "a fundamental new data model concept" [jaxenter neo4j guy](http://jaxenter.com/quite-extraordinary-release-neo4j-2-0-drops-today.1-49142.html); we were suggesting something like this _years ago_ (2011): [251](https://github.com/neo4j/neo4j/issues/251), which was received with a not so enthusiastic response at that time :)

Features are

- **nice:** efficient retrieval of a subset of nodes (essentially a named index over nodes which is going to be used at the core level)
- **not so nice** no interaction of this with which properties a node with that label is expected to have, or edges between nodes with those labels, or...
- **not so nice either** _sorting_ is lacking as far as I understand.
- **awful** overlapping labels. This just adds complexity for what a uniqueness constraint is, tempts the user to introduce inheritance into the data model, causes frustration. For example, add labels like `banana`, `apple` for fruits, then add another one for `fruit`, and have fun with the uniqueness constraints. See for example [Neo4j group - Usefulness of having multiple labels for one node](https://groups.google.com/forum/#!searchin/neo4j/node$20labels/neo4j/kDX0Ug-QRSc/jcF2c7NjmWYJ)

This blog post has a short introduction on them: [labels and schema indexes in Neo4j](http://www.terminalstate.net/2013/05/labels-and-schema-indexes-in-neo4j.html). It's interesting to see there too that Cypher will use those indexes only in some cases (which for mee looks like pointing to this label thing being more of a convenience/syntax thing; why it wouldn't if not?)

## schemas

Some really minimal support for [_schemas?_](http://docs.neo4j.org/chunked/milestone/graphdb-neo4j-schema.html). 

### indexes

pretty confusing state right now, there's

- ["legacy" indexes]() **not** used at the core level, you need to explicitly declare your intention to use them = useless
- [schema indexes]() tied to a combination of label and property

see [#1782](https://github.com/neo4j/neo4j/issues/1782)

### constraints

Which can be declared on just _properties_, and the only possible contraint is _uniqueness_ (of the value) across nodes with the same _label_; see [neo4j API - ConstraintCreator](http://api.neo4j.org/2.0.0-M06/org/neo4j/graphdb/schema/ConstraintCreator.html).

> what about the interaction of (de)assigning labels to nodes and uniqueness constraints? is this managed somehow? and even worse, what about overlaps between **different** labels?

#### our Neo4j experience

- https://github.com/neo4j/neo4j/issues/253 (migrated)
- https://github.com/neo4j/neo4j/issues/236 (migrated)
- https://groups.google.com/d/msg/neo4j/SbmEkQniViY/9yzVsn2e4nAJ
- https://groups.google.com/d/topic/neo4j/r5T64_Lx_nc/discussion

# titan and bio4j

This is a good (if definitely outdated) summary

- [Aurelius group - Titan vs Neo4j](https://groups.google.com/forum/#!msg/aureliusgraphs/vkQkzjN8fo0/9YYgqI4TA0QJ)

I'm not adding anything coming from the Neo4j side, basically because there's no such thing.

## type definitions

We have a really rich schema, and we want to take advantage of this

- queries
- store: declare types, efficiency, constraints

##### refs

- [Titan - Type definition overview](https://github.com/thinkaurelius/titan/wiki/Type-Definition-Overview#cardinality-constraints)
- [Aurelius - Database schema design best practices on Titan](https://groups.google.com/forum/#!topic/aureliusgraphs/fAkDSD3njaI)
- [Aurelius - type defs and batch loading](https://groups.google.com/forum/#!topic/aureliusgraphs/bmUkY29dI7U)

## constraints

## indexing

## in-memory cache

- [Boutique graph data with titan](http://java.dzone.com/articles/boutique-graph-data-titan)

##### refs

- [Titan - Vertex centric indexes](https://github.com/thinkaurelius/titan/wiki/Vertex-Centric-Indices)
- [Tinkerpop - Vertex query](https://github.com/tinkerpop/blueprints/wiki/Vertex-Query)
- [Vertex Query API](http://thinkaurelius.github.io/titan/javadoc/0.4.2/com/thinkaurelius/titan/core/TitanVertexQuery.html)
- [A solution to the supernode problem](http://thinkaurelius.com/2012/10/25/a-solution-to-the-supernode-problem/)

# Neo4j vs titan

Basically the biggest difference for us is the lack of value-dependent indexes in Neo4j. 

This benchmarks give you great insight even in the case of a pretty small dataset

- [boutique graphs results graphics](http://aurelius-blog.s3-website-us-east-1.amazonaws.com/boutique-graphs/results/plot.html)

## labels as vertex-centric indexes

You just need to reify the label into a node `L`, and create relationships with label `L` pointing to that node for those vertices which you want labeled with `L`

```
v -[L]-> L
```

Now, if you want this to behave like a label you need to

- have just one `L` node together with an index (use a label global index, or something similar)
- make the `-[L]->` relation to be "manyToOne" (see [Titan cardinality constraints](https://github.com/thinkaurelius/titan/wiki/Type-Definition-Overview#cardinality-constraints))

This pattern lets you get everything that you could with labels and much more; you can 

- add a _label-specific_ id to the `-[L]->` edge
- effectively use this as a namespace
- sort your elements inside one label
- nest labels easily without losing performance (just use a composite key)
- separate the declaration of a label `L` with how elements labeled with it are accessed

You get all this now, which for labels can be a bit not so true right now [SO - Neo4j labels and how to speed up counting labelled nodes?](https://stackoverflow.com/questions/17513607/neo4j-labels-and-how-to-speed-up-counting-labelled-nodes). And most importantly it is using the graph structure as the index, which is the key differentiating feature of graph databases.

#### labels, labels

- [operations over labels](https://groups.google.com/forum/#!searchin/neo4j/labels/neo4j/youKWcnszfo/r7QZq1dodMEJ)
- [slow label intersection](https://groups.google.com/forum/#!searchin/neo4j/labels/neo4j/DbtvmyZ2W-A/lODTDYK0KHYJ)

