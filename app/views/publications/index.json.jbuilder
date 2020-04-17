# frozen_string_literal: true

json.array! @publications, partial: 'publications/publication', as: :publication
