/**
 * Hierarchical model for Cepheid variables
 * - Multiple galaxies
 * - Shared sigma_m
 * - Weakly informative priors
 **/

data {

  /* usual inputs */
  int Ng; // number of Galaxies
  int Nt; // sum(Nc_g)
  
  int gal_id[Nt]; // galaxy id for each entry [1 - 9] 
  vector[Nt] m_obs; // obs apparent mag.
  real sigma_m; // mag uncertainty
  vector[Nt] log10P; // log10(periods/days)
  vector[Ng] z; // redshift of single galaxy

}

transformed data {

  vector[Ng] dL;
  
  /* luminosity distance */
  dL = (3.0e5 * z) / 70.0; // Mpc
  
}

parameters {

  /* parameters of the parent distributions */
  real mu_alpha;
  real<lower=0> tau_alpha;

  real mu_beta;
  real<lower=0> tau_beta;

  /* individual galaxy parameters */
  vector[Ng] alpha;
  vector[Ng] beta;
  
}

transformed parameters {

  vector[Nt] M_true;
  vector[Nt] m_true;

  /* P-L relation */
  M_true = alpha[gal_id] + beta[gal_id] .* log10P;

  /* convert to m */
  m_true = M_true + 5 * log10(dL[gal_id]) + 25;
    
}

model {  

  /* priors */
  mu_alpha ~ normal(0, 10);
  mu_beta ~ normal(-5, 5);
  tau_alpha ~ cauchy(0, 2.5);
  tau_beta ~ cauchy(0, 2.5);

  /* connection to latent params */
  alpha ~ normal(mu_alpha, tau_alpha);
  beta ~ normal(mu_beta, tau_beta);
  
  /* connection to data */
  m_obs ~ normal(m_true, sigma_m);

}

