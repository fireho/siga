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

class Document < ActiveRecord::Base
  belongs_to :documentable, :polymorphic => true

  # :cpf, :cnh, :rg, cert_nasc, tipo sanguineo
  symbolize :kind, :in => [:cpf, :cnh, :rg]

end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: documents
#
#  id                :integer         not null, primary key
#  documentable_id   :integer         not null
#  documentable_type :string(255)     not null
#  kind              :string(10)      not null
#  value             :string(255)     not null
#  extra             :string(255)
#  note              :string(255)
#  state             :string(255)
#  emitter           :string(255)
#  emit_at           :date
#  invalid_at        :date
#  created_at        :timestamp
#  updated_at        :timestamp
#

