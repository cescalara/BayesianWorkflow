data {

  int N;
  vector[N] x;

}

parameters {

  real<lower=0, upper=1> f;
  real<lower=0, upper=1> mu;
  
}

model {

  for (i in 1:N) {

    target += log_sum_exp(log(f) + normal_lpdf(x[i] | mu, 0.2),
			  log(1-f) + uniform_lpdf(x[i] | 0, 1));

  }
  
}
