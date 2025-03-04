# rain-chaos
Despite its initial apparent simplicity, rainfall is a highly complex process and one which is core to a number of scientific disciplines, such as meteorology, hydrology, geology, and ecology [@Hu]. A proper understanding of rainfall behavior across different scales in time and space could provide valuable insights into a variety of practical issues, expecially flooding, in order to develop local bclimate adaptation planning.
Unfortunately, precise modelling and quantification of rainfall data is not an easy task due to its highly variable nature. Rainfall is usually highly intermittent and as such exhibits variability over a wide range of temporal and spatial scales. Furthermore, the difficulty
is enhanced due to the limitation in the availability of ‘appropriate’ mathematical tools to investigate the structure underlying the
rainfall processes. The investigation of the existence of chaos in hydrological processes has been of much interest [@Sivakumar]. 
## Science of chaos
Chaos theory has gained interest in hydrology for its ability to explain the spatial and temporal variability of hydrological processes such as precipitation and runoff. The application of chaos theory is often criticized due to the limitations of chaos identification methods, which assume infinite and noise-free time series, while hydrological data are finite and noisy.
Various methods have been developed: correlation dimension, Lyapunov exponent, and nonlinear prediction. No single method can infallibly distinguish between a chaotic and a stochastic system. The data size required to accurately estimate the correlation dimension can be very large, but studies have shown that even smaller data sets can provide reasonable estimates. Noise can significantly affect results, especially in nonlinear prediction. It is important to determine the noise level and apply noise reduction methods.
Choosing the appropriate delay time is crucial for phase-space reconstruction. Common methods include the autocorrelation function and mutual information.
Despite the limitations, many studies have provided convincing evidence of the existence of chaos in hydrological processes. Nonlinear prediction, in particular, has shown promising results.
Chaos theory offers an alternative approach to characterizing and modeling hydrological processes. Despite criticisms, the evidence suggests that hydrological processes can be better understood through deterministic chaotic models.
## Code description

## Data
In this example we provide to kinds of data: 
- sub daily raw data (see https://www.dati.lombardia.it/Ambiente/Precipitazioni-dal-2011-al-2020/2kar-pnuk/data_preview) 
- daily data, as downloaded from SCIA (https://scia.isprambiente.it/servertsdailyutm/serietemporalidaily400.php)
## References
@Hu https://www.mdpi.com/2073-4441/11/3/579  
@Sivakumar https://doi.org/10.1016/S0022-1694(99)00186-9
