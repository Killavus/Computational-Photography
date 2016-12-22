DEPTHS = 9;
CENTRAL_KERN = 4;
WEIGHT = 250 * (0.005 ^ 2);
IMAGES = {
  '../CodedApertureData/people_inp.bmp'
  '../CodedApertureData/cups_board_inp.bmp'
  '../CodedApertureData/beer_coke_inp.bmp'
};

Kernels = [];

for k = 1:DEPTHS
  data = load(sprintf('../CodedApertureData/filts/filt_scl%02d.mat', k));
  filts = getfield(data, 'filts');
  Kernels = [ Kernels filts(CENTRAL_KERN) ];
end

s = size(IMAGES);
for l = 1:s(2)
  img = double(imread(char(IMAGES(l)))) / 255.0;

  for k = 1:DEPTHS
    kern = cell2mat(Kernels(k));
    red = deconvSps(img(:, :, 1), kern, WEIGHT);
    green = deconvSps(img(:, :, 2), kern, WEIGHT);
    blue = deconvSps(img(:, :, 3), kern, WEIGHT);

    deblurred = cat(3, red, green, blue);
    save(sprintf('%s_%d', char(IMAGES(l)), k), ['deblurred']);
  end
end

