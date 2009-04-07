# -*- coding: utf-8 -*-
#
#   Copyright © 2009 Fireho
#
#   This file is part of SIGA.
#
#   SIGA is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   SIGA is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
class Opt < ActiveRecord::Base

  OPT = {
    :online => true,
    :city => "Sig@ Cidade Teste",
    :welcome => "Bem Vindo ao SIG@",
    :enable_gis => true,
    :enable_modules => true
  }

  validates_presence_of :key, :value


  def method_missing(m)
    OPT.each { |o| return o if m =~ o.key }
    super
  end

end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: opts
#
#  id         :integer         not null, primary key
#  key        :string(255)
#  value      :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

