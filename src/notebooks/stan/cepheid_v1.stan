/**
 * Initial model for Cepheid variables
 * - Single galaxy
 * - Shared sigma_m
 * - Weakly informative priors
 **/

data {

  /* usual inputs */
  int Nc; // number of Cepheids
  vector[Nc] m_obs; // obs apparent mag.
  real sigma_m; // mag uncertainty
  vector[Nc] log10P; // log10(periods/days)
  real z; // redshift of single galaxy

  /* for generated quantities */
  int Ngrid;
  vector[Ngrid] log10P_grid;
}

transformed data {

  real dL;
  
  /* luminosity distance */
  dL = (3.0e5 * z) / 70.0; // Mpc
  
}

parameters {

  /* parameters of the P-L relation */
  real alpha;
  real<upper=0> beta;
  
}

transformed parameters {

  vector[Nc] M_true;
  vector[Nc] m_true;

  /* P-L relation */
  M_true = alpha + beta * log10P;

  /* convert to m */
  m_true = M_true + 5 * log10(dL) + 25;
    
}

model {  

  /* priors */
  alpha ~ normal(0, 10);
  beta ~ normal(-5, 5);
  
  /* likelihood */
  m_obs ~ normal(m_true, sigma_m);
  
}

generated quantities {

  vector[Ngrid] line;

  /* generate the posterior for the P-L relation */
  line = alpha + beta * log10P_grid;
  
}
