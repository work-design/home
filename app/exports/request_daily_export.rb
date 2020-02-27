class RequestDailyExport
  extend RailsData::Export

  config do
    collect -> (params){
      if params[:'created_at-lte']
        params[:'created_at-lte'] = params[:'created_at-lte'].to_time.end_of_day
      end
      WechatRequest.default_where(params)
    }
    column :name, header: '姓名', field: -> (o){ o.wechat_user.user&.name }
    column :s_name, header: '项目名称', field: -> (o){ o.extractions.pluck(:name, :matched).to_h['项目名称'] }
    column :s_crowd, header: '作业班组', field: -> (o){ o.extractions.pluck(:name, :matched).to_h['作业班组'] }
    column :s_todo, header: '工作内容', field: -> (o){ o.extractions.pluck(:name, :matched).to_h['工作内容'] }
    column :s_person, header: '工作负责人', field: -> (o){ o.extractions.pluck(:name, :matched).to_h['工作负责人'] }
    column :s_time, header: '计划工作时间', field: -> (o){ o.extractions.pluck(:name, :matched).to_h['计划工作时间'] }
    column :feedback_on, header: '日期', field: -> (o){ o.created_at.to_s(:date) }
    x_column :month, header: '月度', field: -> (o){ o.created_at.to_s(:month) }
  end

end
