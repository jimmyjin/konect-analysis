%
% Compute a spectral network statistic for a full dataset.
%
% PARAMETERS 
%	$STATISTIC
%	$DECOMPOSITION
%	$NETWORK
%
% INPUT 
%	dat/info.$NETWORK
%	dat/decomposition.$DECOMPOSITION.$NETWORK.mat
%
% OUTPUT 
%	dat/statistic.$STATISTIC.$NETWORK
%		Same format as generated by statistic_comp.m
%

network = getenv('NETWORK');
statistic = getenv('STATISTIC');
decomposition = getenv('DECOMPOSITION');

info = read_info(network); 

data_decomposition = load(sprintf('dat/decomposition.%s.%s.mat', decomposition, network)); 

values = statistic_spectral(statistic, data_decomposition.D, data_decomposition.n);

save(sprintf('dat/statistic.%s.%s', statistic, network), 'values', '-ascii'); 
