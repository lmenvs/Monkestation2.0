import { FeatureChoiced, FeatureDropdownInput, FeatureColorInput, Feature } from '../base';

export const anime: FeatureChoiced = {
  name: 'Anime',
  component: FeatureDropdownInput,
};

export const anime_color: Feature<string> = {
  name: 'Anime color',
  component: FeatureColorInput,
};
