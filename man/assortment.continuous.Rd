\name{assortment.continuous}
\alias{assortment.continuous}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Assortment on continuous vertex values
}
\description{
Calculates the assortativity coefficient for weighted and unweighted graphs with numerical vertex values
}
\usage{
assortment.continuous(graph, vertex_values, weighted = TRUE, 
			SE = FALSE, M = 1, na.rm = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{graph}{A
  	Adjacency matrix, as an N x N matrix.  Can be weighted or binary.
}
  \item{vertex_values}{
	Values on which to calculate assortment, vector of N numbers
}
  \item{weighted}{
	Flag: TRUE to use weighted edges, FALSE to turn edges into binary (even if weights are given)
}
  \item{SE}{
	Calculate standard error using the Jackknife method.
}
  \item{M}{
	Binning value for Jackknife, where M edges are removed rather than single edges.  This helps speed up the estimate for large networks with many edges.
}
  \item{na.rm}{
	Remove all nodes which have NA as vertex_values from both the network and the vertex_values object. If this is False and NAs are present, an error message will be displayed.
}
}
\value{
	This function returns a named list, with two elements:
	
	$r the assortativity coefficient
	$SE the standard error
}
\references{
	Newman (2003) Mixing patterns in networks. Physical Review E (67)
	Farine, D.R. (2014) Measuring phenotypic assortment in animal social networks: weighted associations are more robust than binary edges. Animal Behaviour 89: 141-153.
}
\author{
	Damien Farine  dfarine@orn.mpg.de
}
\examples{
	# DIRECTED NETWORK EXAMPLE
	# Create a random directed network
	N <- 20
	dyads <- expand.grid(ID1=1:20,ID2=1:20)
	dyads <- dyads[which(dyads$ID1 != dyads$ID2),]
	weights <- rbeta(nrow(dyads),1,15)
	network <- matrix(0, nrow=N, ncol=N)
	network[cbind(dyads$ID1,dyads$ID2)] <- weights

	# Create random continues trait values
	traits <- rnorm(N)
	
	# Test for assortment as binary network
	assortment.continuous(network,traits,weighted=FALSE)
	
	# Test for assortment as weighted network
	assortment.continuous(network,traits,weighted=TRUE)
	
	
	
	# UNDIRECTED NETWORK EXAMPLE
	# Create a random undirected network
	N <- 20
	dyads <- expand.grid(ID1=1:20,ID2=1:20)
	dyads <- dyads[which(dyads$ID1 < dyads$ID2),]
	weights <- rbeta(nrow(dyads),1,15)
	network <- matrix(0, nrow=N, ncol=N)
	network[cbind(dyads$ID1,dyads$ID2)] <- weights
	network[cbind(dyads$ID2,dyads$ID1)] <- weights
	
	# Create random continues trait values
	traits <- rnorm(N)
	
	# Test for assortment as binary network
	assortment.continuous(network,traits,weighted=FALSE)
	
	# Test for assortment as weighted network
	assortment.continuous(network,traits,weighted=TRUE)


}
