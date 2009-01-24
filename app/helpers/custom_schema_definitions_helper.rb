# To change this template, choose Tools | Templates
# and open the template in the editor.
module CustomSchemaDefinitionsHelper

  def custom_schema_definitions_html(arg1)
    r = '<tr>'
    r += '<td>' + t('activerecord.attributes.custom_schema_definitions.created_on') + '</td>'
    r += '<td>' + custom_schema_definitions_on(arg1,'created') + '</td>'
    r += '</tr>'
    r += '<tr>'
    r += '<td>' + t('activerecord.attributes.custom_schema_definitions.created_by') + '</td>'
    r += '<td>' + custom_schema_definitions_by(arg1,'created') + '</td>'
    r += '</tr>'
    r += '<tr>'
    r += '<td>' + t('activerecord.attributes.custom_schema_definitions.updated_on') + '</td>'
    r += '<td>' + custom_schema_definitions_on(arg1,'updated') + '</td>'
    r += '</tr>'
    r += '<tr>'
    r += '<td>' + t('activerecord.attributes.custom_schema_definitions.updated_by') + '</td>'
    r += '<td>' + custom_schema_definitions_by(arg1,'updated') + '</td>'
    r += '</tr>'
    r += '<tr>'
    r += '<td>' + t('activerecord.attributes.custom_schema_definitions.approved_by') + '</td>'
    r += '<td>' + custom_schema_definitions_by(arg1,'approved') + '</td>'
    r += '</tr>'
    return r
  end

  def custom_schema_definitions_on(arg1,arg2)
    case arg2
    when 'created'
      r = '...?...'
      r = arg1.created_on.to_s(:db) if arg1.created_on.is_a?(Date) || arg1.created_on.is_a?(Time)
    when 'updated'
      r = '...?...'
      r = arg1.updated_on.to_s(:db) if arg1.updated_on.is_a?(Date) || arg1.updated_on.is_a?(Time)
    end
    return r
  end

  def custom_schema_definitions_by(arg1,arg2)
    case arg2
    when 'created'
      r = arg1.created_by == 0 ? '...?...' : created_by_html(arg1)
    when 'updated'
      r = arg1.updated_by == 0 ? '...?...' : updated_by_html(arg1)
    when 'approved'
      r = arg1.approved_by == 0 ? '...?...' : approved_by_html(arg1)
    end
    return r
  end

  def created_by_html(arg1)
    user = TrstUser.find(arg1.created_by)
    r = user.full_name
    r += ' ' + t('activerecord.attributes.custom_schema_definitions.authenticated_as')
    r += ' <strong>' + user.login + '</strong'
    return r
  end

  def updated_by_html(arg1)
    user = TrstUser.find(arg1.updated_by)
    r = user.full_name
    r += ' ' + t('activerecord.attributes.custom_schema_definitions.authenticated_as')
    r += ' <strong>' + user.login + '</strong'
    return r
  end

  def approved_by_html(arg1)
    user = TrstUser.find(arg1.approved_by)
    r = user.full_name
    r += ' ' + t('activerecord.attributes.custom_schema_definitions.authenticated_as')
    r += ' <strong>' + user.login + '</strong'
    return r
  end

end