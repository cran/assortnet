\name{assortment.discrete}
\alias{assortment.discrete}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Assortment on discrete vertex values
}
\description{
Calculates the assortativity coefficient for weighted and unweighted graphs with nominal/categorical vertex values
}
\usage{
assortment.discrete(graph, types, weighted = TRUE, SE = FALSE, M = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{graph}{
  	Adjacency matrix, as an N x N matrix.  Can be weighted or binary.
}
  \item{types}{
	Values on which to calculate assortment, vector of N labels
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
}
\value{
	This function returns a named list, with three elements:
	
	$r the assortativity coefficient
	$SE the standard error
	$mixing_matrix the mixing matrix with the distribution of edges or edge weights by category
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

	# Create random discrete trait values
	traits <- rpois(N,2)
	
	# Test for assortment as binary network
	assortment.discrete(network,traits,weighted=FALSE)
	
	# Test for assortment as weighted network
	assortment.discrete(network,traits,weighted=TRUE)
	
	
	
	# UNDIRECTED NETWORK EXAMPLE
	# Create a random undirected network
	N <- 20
	dyads <- expand.grid(ID1=1:20,ID2=1:20)
	dyads <- dyads[which(dyads$ID1 < dyads$ID2),]
	weights <- rbeta(nrow(dyads),1,15)
	network <- matrix(0, nrow=N, ncol=N)
	network[cbind(dyads$ID1,dyads$ID2)] <- weights
	network[cbind(dyads$ID2,dyads$ID1)] <- weights
	
	# Create random discrete trait values
	traits <- rpois(N,2)
	
	# Test for assortment as binary network
	assortment.discrete(network,traits,weighted=FALSE)
	
	# Test for assortment as weighted network
	assortment.discrete(network,traits,weighted=TRUE)

}
