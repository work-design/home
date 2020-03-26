class RequestDailyExport
  extend RailsData::Export

  config do
    collect -> (params){
      if params[:'created_at-lte']
        params[:'created_at-lte'] = params[:'created_at-lte'].to_time.end_of_day
      end
      TextRequest.default_where(params)
    }
    column header: '姓名', field: ->(o) { o.wechat_user.user&.name }
    column header: '项目名称', field: ->(o) { o.wechat_extractions.pluck(:name, :matched).to_h['项目名称'] }
    column header: '作业班组', field: ->(o) { o.wechat_extractions.pluck(:name, :matched).to_h['作业班组'] }
    column header: '工作内容', field: ->(o) { o.wechat_extractions.pluck(:name, :matched).to_h['工作内容'] }
    column header: '工作负责人', field: ->(o) { o.wechat_extractions.pluck(:name, :matched).to_h['工作负责人'] }
    column header: '计划工作时间', field: ->(o) { o.wechat_extractions.pluck(:name, :matched).to_h['计划工作时间'] }
    column header: '日期', field: ->(o) { o.created_at.to_s(:date) }
    column header: '月度', field: ->(o) { o.created_at.to_s(:month) }, x_axis: true
  end

end
