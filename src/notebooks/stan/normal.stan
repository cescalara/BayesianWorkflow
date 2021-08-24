data{
    int N;
    vector[N] x;
}

parameters { 
    real mu;
    real sigma;
}

model {
    x ~ normal(mu, sigma);
}
