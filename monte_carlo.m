clc; clear;

N = 2e5;
mass_samples = randsample([310, 308, 309, 312, 310, 311], N, true);  % in grams
m = mass_samples / 1000;  % Convert to kg
g = normrnd(9.78925, 0.00032, [N, 1]);
l = (148.5 + (151.5 - 148.5) * rand(N, 1)) / 1000;  % in meters
u = trirnd_custom(19.994, 20.000, 20.006, N) / 1000;  % in meters
b = normrnd(40.000, 0.035, [N, 1]) / 1000;  % in meters
d = randsample([1.35, 1.38, 1.34, 1.36, 1.37], N, true) / 1000;  % in meters
m = m(:);
g = g(:);
l = l(:);
u = u(:);
b = b(:);
d = d(:);

E = (m .* g .* l.^3) ./ (u .* b .* d.^3);  % result in Pascals (Pa)

mean_E = mean(E);
std_E = std(E);

fprintf('Estimated Elastic Modulus (Mean): %.2e Pa\n', mean_E);
fprintf('Uncertainty (Standard Deviation): %.2e Pa\n', std_E);

figure;
histogram(E, 100, 'Normalization', 'pdf', 'FaceColor', [0.1 0.5 0.8]);
xlabel('Elastic Modulus E (Pa)');
ylabel('Probability Density');
title('Monte Carlo Simulation - Distribution of Elastic Modulus (E)');
grid on;

