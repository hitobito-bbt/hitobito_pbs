# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe AutoLinkHelper do

  it 'links www addresses' do
    expect(auto_link('www.puzzle.ch')).to eq('<a href="http://www.puzzle.ch" target="_blank">www.puzzle.ch</a>')
  end

  it 'links http addresses' do
    expect(auto_link('http://puzzle.ch')).to eq('<a href="http://puzzle.ch" target="_blank">http://puzzle.ch</a>')
  end

  it 'links ftps addresses' do
    expect(auto_link('ftps://puzzle.ch')).to eq('<a href="ftps://puzzle.ch" target="_blank">ftps://puzzle.ch</a>')
  end

  it 'links email addresses' do
    expect(auto_link('admin@puzzle.ch')).to eq('<a href="mailto:admin@puzzle.ch">admin@puzzle.ch</a>')
  end

  it 'does not link addresses without www' do
    expect(auto_link('abc.puzzle.ch')).to eq('abc.puzzle.ch')
  end

  it 'does not link www.' do
    expect(auto_link('www.')).to eq('www.')
  end

  it 'does not link anything with @' do
    expect(auto_link('@puzzle.ch')).to eq('@puzzle.ch')
    expect(auto_link('a$#!@puzzle.ch')).to eq('a$#!@puzzle.ch')
  end

end