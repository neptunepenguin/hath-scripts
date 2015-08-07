#!/usr/bin/env Rscript

data <- read.table('results', header=T)
data <- data.frame(q=data[,1], kb=data[,2]/1024)
p    <- data[data$q %in% c(60,80,92),]
svg('graph.svg')
plot( data
    , main='JPEG compression, all files croped at 1280x1280px'
    , sub='marks at 60 (inflexion), 80 (linear aprox.) and 92 (JPEG default)'
    , xlab='JPEG quality'
    , ylab='filesize in KBs (average)'
    , pch='+'
    , col='blue'
    )
points( p
      , pch='|'
      , col='red'
      )

